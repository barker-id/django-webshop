'use strict';
$(document).ready(function () {
    $('#sort').change(function () {
        var searchParams = new URLSearchParams(window.location.search);
        console.log(searchParams);
        searchParams.set("sort", $(this).val());
        window.location.search = searchParams.toString();
    });
});

var products;

if (document.getElementById('js-data')) {
    products = JSON.parse(document.getElementById('js-data').textContent);
    products = JSON.parse(products);
    console.log(products);
}

// formatNumber – STACKOVERFLOW
function formatNumber(n, c, d, t) {
    var c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d === undefined ? '.' : d,
        t = t === undefined ? ',' : t,
        s = n < 0 ? '-' : '',
        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
        j = (j = i.length) > 3 ? j % 3 : 0;
    return s + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, '$1' + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '');
};

// Allow the formatNumber function to be used as a filter – STACKOVERFLOW
Vue.filter('formatCurrency', function (value) {
    return formatNumber(value, 2, '.', ',');
});

Vue.component('shopping-cart', {

    props: ['items'],

    computed: {
        Total() {
            let total = 0;

            this.items.forEach(item => {
                total += (item.fields.product_price * item.fields.product_quantity);
            });

            return total;
        }
    },

    methods: {
        removeItem(index) {
            this.items.splice(index, 1)
        }
    }
})

const vm = new Vue({
    delimiters: ['{', '}'],
    el: '#app',

    data: {
        cartItems: [],
        items: products
    },

    methods: {
        addToCart(itemToAdd) {
            console.log(itemToAdd);
            // console.log(itemToAdd.fields.product_quantity);

            // Add the item or increase quantity
            // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
            let itemInCart = this.cartItems.filter(item => item.pk === itemToAdd.pk);
            let isItemInCart = itemInCart.length > 0;

            if (isItemInCart === false) {

                //DEEP CLONE itemToAdd
                //stackoverflow.com/questions/30578254/does-vue-js-have-a-built-in-way-to-add-a-copy-of-a-persistent-object-to-a-repeat
                itemToAdd = JSON.parse(JSON.stringify(itemToAdd));
                this.cartItems.push(Vue.util.extend({}, itemToAdd));

            } else {
                itemInCart[0].fields.product_quantity += Number(itemToAdd.fields.product_quantity);
                // console.log(itemInCart[0].fields.product_quantity);
                // console.log(itemToAdd.fields.product_quantity);
            }

            console.log(this.cartItems);
            itemToAdd.fields.product_quantity = 1;
        }
    }
})
