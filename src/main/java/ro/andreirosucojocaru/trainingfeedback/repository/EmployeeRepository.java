package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.Employee;

import javax.transaction.Transactional;

@Transactional
public interface EmployeeRepository extends CrudRepository<Employee, Long> {
}
