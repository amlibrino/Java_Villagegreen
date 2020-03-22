/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.afpa.villagegreen;

/**
 *
 * @author h-mid
 */
public class Pays {
    private int id;
    private String nomPays;

    public Pays() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomPays() {
        return nomPays;
    }

    public void setNomPays(String nomPays) {
        this.nomPays = nomPays;
    }
    
    //pour afficher le nom du pays dans la combox
        @Override
    public String toString() {
        return this.nomPays;
    }
  

}
