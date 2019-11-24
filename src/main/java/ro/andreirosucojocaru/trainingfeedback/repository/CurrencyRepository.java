package ro.andreirosucojocaru.trainingfeedback.repository;

import org.springframework.data.repository.CrudRepository;
import ro.andreirosucojocaru.trainingfeedback.domain.Currency;

import javax.transaction.Transactional;

@Transactional
public interface CurrencyRepository extends CrudRepository<Currency, Long> {
}
