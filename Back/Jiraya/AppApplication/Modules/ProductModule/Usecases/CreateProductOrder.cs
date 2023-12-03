using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class CreateProductOrder
    {
        private readonly IProductRepository _repository;
        public CreateProductOrder(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(ProductOrder product)
        {
            await _repository.CreateProductOrderAsync(product);
        }
    }
}
