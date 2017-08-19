package cl.bean;

import java.util.List;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import pojos.Personas;
import services.PersonasFacadeLocal;

@Named(value = "personasBean")
@RequestScoped
public class PersonasBean {

    @EJB
    private PersonasFacadeLocal personasFacade;

    public PersonasBean() {
    }
    
    public List<Personas> getPersonas(){
        System.out.println("TOTAL: "+personasFacade.count());
        return personasFacade.findAll();
    }
}
