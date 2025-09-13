package com.itheima.domain;
//lombok


import lombok.Data;

import java.io.Serializable;
import java.util.Date;


@Data
public class Wine{


    private Integer id;

    private String isbn;

    private String wineName;

    private String author;

    private String synopsis;

    private String publisher;

    private String publicationDate;

    private String last;

    private String notes;


}