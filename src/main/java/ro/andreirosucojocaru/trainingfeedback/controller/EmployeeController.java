package ro.andreirosucojocaru.trainingfeedback.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ro.andreirosucojocaru.trainingfeedback.domain.Employee;
import ro.andreirosucojocaru.trainingfeedback.repository.EmployeeRepository;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
public class EmployeeController {

    @Autowired
    private EmployeeRepository employeeRepository;

    @PostMapping("/employee/add")
    public void addEmployee(@RequestBody Employee employee) {
        employeeRepository.save(employee);
    }

    @GetMapping("/login")
    public boolean login(@RequestParam String username, @RequestParam String password) {
        return employeeRepository.findEmployeeByUsernameAndPassword(username, password).iterator().hasNext();
    }
}
