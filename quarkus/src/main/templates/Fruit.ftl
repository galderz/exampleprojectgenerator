package com.test;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * @author Heiko Braun
 */
@Entity
@Table(name = "known_fruits${no}")
public class Fruit${no} {

    @Id
    @SequenceGenerator(
            name = "fruitsSequence${no}",
            sequenceName = "known_fruits_id_seq${no}",
            allocationSize = 1,
            initialValue = 4)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "fruitsSequence${no}")
    private Integer id;

    @Column(length = 40, unique = true)
    private String name;

<#list 1..30 as l>
    @Column(name = "VERY_LONG_STRING_COLUMN_NAME_${l}")
    private String attr_${l};

</#list>
    public Fruit${no}() {
    }

    public Fruit${no}(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

<#list 1..30 as l>
    public String getAttr${l}() {
        return attr_${l};
    }

    public void setAttr${l}(String name) {
        this.attr_${l} = name;
    }

</#list>
}
