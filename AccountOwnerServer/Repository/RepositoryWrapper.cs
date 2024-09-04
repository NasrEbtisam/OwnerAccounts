using Contracts;
using Entities;
using IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class RepositoryWrapper:IRepositoryWrapper
    {
        private AccountownerContext _context;
        private IOwnerRepository _owner;
        private IAccountRepository _account;
        public RepositoryWrapper(AccountownerContext context)
        {
            _context = context;
        }
        public IOwnerRepository Owner
        {
            get
            {
                if (_owner == null)
                {
                    _owner = new OwnerRepository(_context);
                }
                return _owner;
            }
        }
        public IAccountRepository Account
        {
            get
            {
                if (_account == null)
                {
                    _account = new AccountRepository(_context);
                }
                return _account;
            }
        }
        public void  Save()
        {
             _context.SaveChanges();
        }
    }
}
