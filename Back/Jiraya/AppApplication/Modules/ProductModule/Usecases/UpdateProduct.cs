using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class UpdateProduct
    {
        private readonly IProductRepository _repository;
        public UpdateProduct(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(Product product)
        {
            await _repository.UpdateProductAsync(product);
        }
    }
}
