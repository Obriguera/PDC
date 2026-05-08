package ar.edu.ubp.pdc.ajax;

import java.util.LinkedList;
import java.util.List;

public class ItemListBean {

    private List<String> items;

    public ItemListBean() {
        this.items = new LinkedList<String>();
    }

    public void setItem(String item) {
        this.items.add(item);
    }

    public int getItemCount() {
        return this.items.size();
    }

    public String[] getItems() {
        return this.items.toArray(new String[this.items.size()]);
    }

    public void removeItem(String index) {
        int i = Integer.parseInt(index);
        if(i >= 0 && i < this.items.size()) {
            this.items.remove(i);
        }
    }

}
