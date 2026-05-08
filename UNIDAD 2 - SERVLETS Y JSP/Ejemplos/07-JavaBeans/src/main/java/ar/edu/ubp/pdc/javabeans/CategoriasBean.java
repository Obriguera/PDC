package ar.edu.ubp.pdc.javabeans;

public class CategoriasBean {

    private String[] categorias;

    public CategoriasBean() {
    	this.categorias = new String[10];
    }

    //No es un getter común de un bean
    public String getCategoria(int posicion) {
    	return categorias.length > 0 ? categorias[posicion] : null; 
    }

    public String[] getCategorias() {
    	return this.categorias;
    }

    //No es un setter común de un bean
    public void setCategoria(String categoria, int posicion) { 
		this.categorias[posicion] = categoria; 
    }
    
    public void setCategorias(String[] categorias) {
    	this.categorias = categorias;
    }

}
