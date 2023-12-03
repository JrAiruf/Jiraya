using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class UpdateProductImage
    {
        private readonly IProductRepository _repository;
        public UpdateProductImage(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(ProductImage productImage)
        {
            await _repository.UpdateProductImage(productImage);
        }
    }
}
