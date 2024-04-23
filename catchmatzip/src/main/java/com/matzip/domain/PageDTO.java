package com.matzip.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class PageDTO {
	private Integer start;
	private Integer end;
	private boolean prev, next;
	private Integer total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri; 
		this.total = total;
		this.end = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.start = this.end-9;
		
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		if(realEnd<this.end) {
			this.end=realEnd;
		}
		this.prev = this.start>1;
		this.next = this.end<realEnd;
	}

}
