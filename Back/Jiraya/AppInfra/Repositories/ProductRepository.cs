using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;
using AppInfra.Data;
using Microsoft.EntityFrameworkCore;

namespace AppInfra.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly ApplicationDbContext _context;
        public ProductRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task CreateProductAsync(Product product)
        {
            await _context.Products.AddAsync(product);
            await _context.SaveChangesAsync();
        }

        public async Task CreateProductOrderAsync(ProductOrder product)
        {
            await _context.ProductOrders.AddAsync(product);
            await _context.SaveChangesAsync();
        }

        public async Task<Product> GetProductAsync(Guid id)
        {
            var product = await _context.Products.FirstOrDefaultAsync(product => product.Id == id);
            return product;
        }

        public async Task<ProductOrder> GetProductOrderAsync(Guid id)
        {
            var product = await _context.ProductOrders.FirstOrDefaultAsync(product => product.Id == id);
            return product;
        }

        public async Task<List<Product>> GetProductsAsync()
        {
            return await _context.Products.ToListAsync();
        }

        public async Task<List<ProductOrder>> GetProductOrdersAsync()
        {
            return await _context.ProductOrders.ToListAsync();
        }

        public async Task UpdateProductAsync(Product product)
        {
            var currentProduct = await GetProductAsync(product.Id);
            if (currentProduct != null)
            {
                _context.Products.Update(product);
                await _context.SaveChangesAsync();
            }
        }

        public async Task UpdateProductOrderAsync(ProductOrder product)
        {
            var currentProduct = await GetProductOrderAsync(product.Id);
            if (currentProduct != null)
            {
                _context.ProductOrders.Update(product);
                await _context.SaveChangesAsync();
            }
        }

        public async Task DeleteProductAsync(Guid id)
        {
            var currentProduct = await GetProductAsync(id);
            _context.Products.Remove(currentProduct);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteProductOrderAsync(Guid id)
        {
            var currentProduct = await GetProductOrderAsync(id);
            _context.ProductOrders.Remove(currentProduct);
            await _context.SaveChangesAsync();
        }

        public async Task UploadProductImage(ProductImage productImage)
        {
            await _context.ProductImages.AddAsync(productImage);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateProductImage(ProductImage productImage)
        {
            ProductImage selectedImage = await _context.ProductImages.FindAsync(productImage.Id);
            if (selectedImage != null) 
            {
                _context.ProductImages.Update(productImage);
                await _context.SaveChangesAsync();
            }
        }

        public async Task DeleteProductImage(Guid id)
        {
            ProductImage currentImage = await _context.ProductImages.FindAsync(id);
            _context.ProductImages.Remove(currentImage);
            await _context.SaveChangesAsync();
        }

    }
}
