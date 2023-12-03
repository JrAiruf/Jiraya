using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class UpdateProductOrder
    {
        private readonly IProductRepository _repository;
        public UpdateProductOrder(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(ProductOrder product)
        {
            await _repository.UpdateProductOrderAsync(product);
        }
    }
}
