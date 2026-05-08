package ar.edu.ubp.pdc.javabeans;

public class PersonaBean {

    private String apellido, nombre;    

    //Contructor nulo
    public PersonaBean() { }

    //Propiedades de escritura
    public void setApellido(String a) {
        this.apellido = a;
    }
            
    public void setNombre(String n) {
        this.nombre = n;
    }

    //Propiedades de lectura
    public String getApellido() {
        return this.apellido;
    }

    public String getNombre() {
        return this.nombre;
    }

    //Propiedad de solo lectura
    public String getNombreCompleto() {
        return this.apellido + ", " + this.nombre;
    }

}
