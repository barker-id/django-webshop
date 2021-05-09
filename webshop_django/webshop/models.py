from django.db import models

# Create your models here.

class Product(models.Model):
    product_id = models.AutoField(primary_key=True)
    product_code = models.IntegerField()
    product_name = models.CharField(max_length=255)
    product_image = models.ImageField(upload_to='shop/images')
    product_price = models.IntegerField()
    product_quantity = models.IntegerField(default=1)
    product_description = models.TextField(blank=True)
    category = models.CharField(max_length=255)
    shop_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.product_name