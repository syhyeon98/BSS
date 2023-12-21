package kr.or.ddit.pagingVO;

import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

import kr.or.ddit.mail.vo.MailBoxVO;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * 
 * 페이징 처리와 관련된 모든 속성을 가진 객체
 * 
 * 
 */
@NoArgsConstructor
@Getter
public class PaginationInfo<T> {
	
	public PaginationInfo(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
	
	
   //총 페이지 게시물 수 : db의  전체 record 수
   private long totalRecord;
   //총 페이지 수 : screenSize / totalRecord
   private int screenSize = 10;
   //한 화면에 보여줄 페이지 : 5  
   private int blockSize = 5;
    
   private long totalPage; // 연산1
   private long currentPage; // request Parameter
   
   private long startRow; //연산2
   private long endRow;   //연산3
   
   private long startPage; //연산4
   private long endPage;   //연산5
   
   private SimpleCondition simpleCondition;
   
   // 검색 보완	
   private Map<String,Object> detailCondition;
   
   private String empMail;
   private String empCd;
   private String empName;
   private String loginEmpCd;
   private String loginEmpMail;
   private String depCd;
   private Integer trainNo;
   
   private List<T> dataList;
   private T detailConditionVO;
 
   public void setDetailConditionVO(T detailConditionVO) {
	this.detailConditionVO = detailConditionVO;
}
   
   public void setDetailCondition(Map<String, Object> detailCondition) {
	this.detailCondition = detailCondition;
   }
   
   public void setEmpMail(String empMail) {
	   this.empMail = empMail;
   }
   
   public void setEmpCd(String empCd) {
	   this.empCd = empCd;
   }

   public void setLoginEmpCd(String loginEmpCd) {
	   this.loginEmpCd = loginEmpCd;
   }
   
   public void setLoginEmpMail(String loginEmpMail) {
	   this.loginEmpMail = loginEmpMail;
   }
  
   public void setDepCd(String depCd) {
	   this.depCd = depCd;
   }
   
   public void setTrainNo(Integer trainNo) {
	   this.trainNo = trainNo;
   }
   
   public void setSimpleCondition(SimpleCondition simpleCondition) {
	this.simpleCondition = simpleCondition;
	
   }
   
   public void setDataList(List<T> dataList) {
      this.dataList = dataList;
   }

   
   public void setTotalRecord(long totalRecord) {
      this.totalRecord = totalRecord;
      this.totalPage = (totalRecord + screenSize-1) / screenSize;
   }
   
   public void setCurrentPage(long currentPage) {
      this.currentPage = currentPage;
      this.endRow = currentPage * screenSize;
      this.startRow = endRow-(screenSize-1);
      
      this.endPage = ((currentPage + blockSize-1) / blockSize) * blockSize;
      this.startPage = endPage - (blockSize -1);
   
   }

   String htmlPattern = "<li class='page-item'><a class='page-link' href=''javascript:fn_paging({0})'' data-page=''{0}''>{1}</a></li>";
   
   public String getPagingHTML() {
      StringBuilder html = new StringBuilder();
      html.append("<ul class='pagination  justify-content-center'>");
      if(startPage > 1) {
         html.append(
               MessageFormat.format(htmlPattern, startPage-1, "이전")
         );
      }
      
      endPage = endPage > totalPage ? totalPage : endPage;
      
      for(long page = startPage; page <= endPage; page ++) {
         html.append(
               MessageFormat.format(htmlPattern, page, page)
         );
      }
      
      if(endPage < totalPage) {
         html.append(
               MessageFormat.format(htmlPattern, endPage+1, "다음")
         );
      }
      html.append("</ul>");
      return html.toString();
   }
}