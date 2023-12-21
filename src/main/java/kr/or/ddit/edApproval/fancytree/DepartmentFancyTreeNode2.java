package kr.or.ddit.edApproval.fancytree;

import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import kr.or.ddit.department.vo.DepartmentVO;

public class DepartmentFancyTreeNode2 extends FancyTreeNodeAdapter<DepartmentVO> {

    public DepartmentFancyTreeNode2(DepartmentVO data) {
        super(data);
    }

    @Override
    public String getTitle() {
        return getData().getDepName();
    }

    @Override
    public String getKey() {
        return getData().getDepCd();
    }

    @Override
    public boolean isFolder() {
        return true; // Department는 폴더 역할
    }
    
    @Override
    public boolean isLazy() {
        return isFolder(); // isLazy(): 지연로딩, 폴더 노드를 클릭할 때 필요한 데이터만 요청
    }
    
    // empList 자식으로 불러오기
//	@Override
//	public List<FancyTreeNode<?>> getChildren() {
//		return Optional.ofNullable(getData().getEmpList())
//						.orElse(new HashSet<>())
//						.stream()
//						.map(EmployeeFancyTreeNode::new)
//						.collect(Collectors.toList());
//	}
//    
	

    @Override
    public List<FancyTreeNode<?>> getChildren() {
        List<EmployeeFancyTreeNode2> employeeNodes = Optional.ofNullable(getData().getEmpList())
                                                            .orElse(new HashSet<>())
                                                            .stream()
                                                            .map(EmployeeFancyTreeNode2::new)
                                                            .collect(Collectors.toList());
        
        // "poCd"를 기준으로 정렬
        employeeNodes.sort(Comparator.comparing(node -> node.getData().getPoCd()));

        return employeeNodes.stream()
                            .map(node -> (FancyTreeNode<?>) node)
                            .collect(Collectors.toList());
    }
	
}





