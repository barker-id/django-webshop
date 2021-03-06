# Generated by Django 3.1.7 on 2021-03-19 13:26

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('product_id', models.AutoField(primary_key=True, serialize=False)),
                ('product_code', models.IntegerField()),
                ('product_name', models.CharField(max_length=255)),
                ('product_image', models.ImageField(upload_to='shop/images')),
                ('product_price', models.IntegerField()),
                ('product_description', models.TextField(blank=True)),
                ('category', models.CharField(max_length=255)),
                ('shop_name', models.CharField(max_length=255)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
