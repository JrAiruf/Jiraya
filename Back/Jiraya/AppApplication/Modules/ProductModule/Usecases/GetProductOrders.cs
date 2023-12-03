using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class GetProductOrders
    {
        private readonly IProductRepository _repository;
        public GetProductOrders(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<ProductOrder>> Handle()
        {
            return await _repository.GetProductOrdersAsync();
        }
    }
}
