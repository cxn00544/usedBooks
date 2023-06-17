package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.pojo.CollectBook;
import com.pojo.CollectBookDetail;

@Repository("collectBookMapper")
public interface CollectBookMapper {
	
	@Insert ("insert into collection productId values (#{productID})")
	int Insert(@Param("bookId") String bookId);
	
	@Insert("insert into Tcollect(bookId,userId) values(#{bookId},#{userId})")
	public int addCollect( CollectBook CollectBookDetail);
	
//	查询所有的收藏信息
	@Select("select * from Tcollect,tsellbookitem WHERE Tcollect.bookId=tsellbookitem.bookId")
	@ResultType(CollectBookDetail.class)
	public List<CollectBookDetail> findAll();
	
//	查询个人的收藏信息
	@Select("select * from Tcollect,tsellbookitem,Tuser,Tbook where tsellbookitem.bookId=Tcollect.bookId and Tbook.ISBN= tsellbookitem.ISBN and Tcollect.userId=Tuser.userId and Tcollect.userId=#{userId}")
	@ResultType(CollectBookDetail.class)
	public List<CollectBookDetail> CollectBookDetailByUserId(int userId);
	
	@Select("select * from Tcollect where collectId=#{collectId}")
	@ResultType(CollectBookDetail.class)
	public CollectBookDetail CollectBookBycollectId(String collectId);
	
	
	@Select("select collectId from Tcollect where collectId=#{collectId}")
	public int collectId(int collectId);
	

	@Delete("delete from Tcollect where collectId=#{collectId}")
	public int DeleteCollect(int collectId);
	
	
	@Select("select *from Tcollect where bookId=#{bookId} and userId=#{userId}")
	@ResultType(CollectBook.class)
	public List <CollectBook> CollectBookByBookId(CollectBook bookId);
	
	
}
