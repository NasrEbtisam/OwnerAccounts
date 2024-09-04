using Contracts;
using Entities;
using Entities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public abstract class RepositoryBase<T> : IRepositoryBase<T> where T : class
    {
        protected AccountownerContext _Context { get; set; }
        public RepositoryBase(AccountownerContext Context)
        {
            _Context = Context;
        }
        public  IQueryable<T> FindAll() =>  _Context.Set<T>().AsNoTracking();
        public  IQueryable<T> FindByCondition(Expression<Func<T, bool>> expression) =>  _Context.Set<T>().Where(expression).AsNoTracking();

        public void Create(T entity) => _Context.Set<T>().Add(entity);
        public void Update(T entity) => _Context.Set<T>().Update(entity);
        public void Delete(T entity) => _Context.Set<T>().Remove(entity);
    }
}
