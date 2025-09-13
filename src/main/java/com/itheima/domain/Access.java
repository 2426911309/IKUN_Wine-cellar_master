package com.itheima.domain;

import lombok.Data;


import java.io.Serializable;
import java.util.Date;

@Data
public class Access implements Serializable {

    private Integer id;


    private String isbnLog;

    private String winenameLog;

    private String workeridLog;

    private String workernameLog;

/*    private Date beginTime;

    private Date endTime;*/

    private String cardidLog;

    private String num;


}