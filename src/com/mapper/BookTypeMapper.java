package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.pojo.BookType;

@Repository("BookTypeMapper")
public interface BookTypeMapper {
	
	@Select("select typeId,typeName from bookct.TbookType order by typeId ASC;")
	public List<BookType> selectBookTypeAll();
}
