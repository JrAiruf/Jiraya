using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class GetProductOrder
    {
        private readonly IProductRepository _repository;
        public GetProductOrder(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task<ProductOrder> Handle(Guid id)
        {
            return await _repository.GetProductOrderAsync(id);
        }
    }
}
