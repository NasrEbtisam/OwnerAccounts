using Contracts;
using Entities;
using Entities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class OwnerRepository : RepositoryBase<Owner>, IOwnerRepository
    {
        public OwnerRepository(AccountownerContext context)
            : base(context)
        {
        }
        public IEnumerable<Owner> GetAllOwners()
        {
            return  FindAll()
               .OrderBy(ow => ow.Name)
               .ToList();
        }
        public Owner GetOwnerById(int id)
        {
            return  FindByCondition(owner => owner.Id.Equals(id))
                .FirstOrDefault();
        }
        public Owner GetOwnerWithDetails(int id)
        {
            return  FindByCondition(owner => owner.Id.Equals(id))
                .FirstOrDefault();
        }
        public void CreateOwner(Owner owner)
        {
            Create(owner);
        }
        public void UpdateOwner(Owner owner)
        {
            Update(owner);
        }
        public void DeleteOwner(Owner owner)
        {
            Delete(owner);
        }
    }
}
