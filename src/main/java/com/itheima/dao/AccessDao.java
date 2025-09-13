package com.itheima.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itheima.domain.Access;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AccessDao extends BaseMapper<Access> {

    @Select("INSERT INTO `tbl_access` (isbn_log, winename_log, workerid_log, workername_log,cardid_log,num)  SELECT tbl_wine.isbn,tbl_wine.wine_name,tbl_worker.worker_id,tbl_worker.worker_name,tbl_worker.card_id,#{num} FROM tbl_worker INNER  JOIN tbl_wine ON worker_id=#{workeridLog} WHERE isbn=#{isbnLog}")
    List<Access> addaccess(Access access);


}
