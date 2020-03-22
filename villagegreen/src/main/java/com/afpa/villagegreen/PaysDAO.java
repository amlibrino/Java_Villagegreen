/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.afpa.villagegreen;

import static com.afpa.villagegreen.dbConnect.con;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author h-mid
 */
public class PaysDAO extends dbConnect {

    public PaysDAO() {
    }

    /**
     * List array list.
     *
     * @return Renvoie la liste des pays avec leurs id et nom en français
     */
    
    public ArrayList<Pays> List() {
        connexion();
        ArrayList<Pays> p = new ArrayList<>();
        try {
            Statement stm = con.createStatement();

            ResultSet result = stm.executeQuery("SELECT `id`, `nom_fr_fr` FROM `pays`");
            while (result.next()) {
            Pays pays = new Pays();

            pays.setId(result.getInt("id"));
            pays.setNomPays(result.getString("nom_fr_fr")); 
            
            p.add(pays);

            }
            stm.close();
            result.close();
        } catch (SQLException e) {
        }
        deconnexion();
        return p;
    }
    
        /**
     * Gets nom.
     *
     * @param id L'id d'un pays
     * @return Son nom en français
     */
    
    public Pays Find(int id) {
        Pays p = new Pays();

        connexion();

        try {
            PreparedStatement stm = con.prepareStatement("SELECT `nom_fr_fr` FROM `pays` WHERE `id`=?");
            stm.setInt(1, id);
            ResultSet result = stm.executeQuery();
            result.next();
            p.setId(id);
            p.setNomPays(result.getString("f_nom"));
            stm.close();
            result.close();
        } catch (SQLException e) {
            System.out.println("Error");
            System.out.println(e.getMessage());
        }
        deconnexion();
        return p;
    }
    
        /**
     * Gets nom.
     *
     * @param id L'id d'un pays
     * @return Son nom en français
     */    
    public String getNom(int id) {

        String nom = "";
            connexion();
        try {
            PreparedStatement stm  = con.prepareStatement("SELECT `nom_fr_fr` FROM `pays` WHERE `id`=?");
            stm.setInt(1, id);
            ResultSet result = stm.executeQuery();
            result.next();
            nom = result.getString("nom_fr_fr");
            
            stm.close();
            result.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        deconnexion();
        return nom;
    }

    /*
    public List<Pays> List() {

        List<Pays> resultat = new ArrayList<Pays>();

        connexion();

        try {

            Statement stm = con.createStatement();

            ResultSet result = stm.executeQuery("SELECT `id`, `nom_fr_fr` FROM `pays`");

            while (result.next()) {
                Pays p = new Pays();
                p.setId(result.getInt("id"));
                p.setNomPays(result.getString("nom_fr_fr"));

                resultat.add(p);
            }

            stm.close();
            result.close();

        } catch (SQLException e) {
            System.out.println("Error while reading 'client'");
            System.out.println(e.getMessage());
        }
        deconnexion();

        return resultat;
    }*/

}
