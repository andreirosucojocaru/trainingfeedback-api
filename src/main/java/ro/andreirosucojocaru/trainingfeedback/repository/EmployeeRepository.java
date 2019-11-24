package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.Employee;

import javax.transaction.Transactional;

@Transactional
public interface EmployeeRepository extends CrudRepository<Employee, Long> {

    @Query("SELECT e FROM Employee e WHERE e.username = ?1 AND e.password = ?2")
    Iterable<Employee> findEmployeeByUsernameAndPassword(String username, String password);
}
