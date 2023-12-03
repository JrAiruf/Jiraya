using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class GetProducts
    {
        private readonly IProductRepository _repository;
        public GetProducts(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<Product>> Handle()
        {
            return await _repository.GetProductsAsync();
        }
    }
}
