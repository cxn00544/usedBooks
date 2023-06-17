package com.pojo;

public class BookType {
	
	private String typeId;
	private String typeName;
	public BookType() {
		super();
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	@Override
	public String toString() {
		return typeId+" "+typeName;
	}
	
	
	

}
