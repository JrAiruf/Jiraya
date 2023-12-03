using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class CreateProduct
    {

        private readonly IProductRepository _repository;
        public CreateProduct(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(Product product)
        {
            await _repository.CreateProductAsync(product);
        }
    }
}
