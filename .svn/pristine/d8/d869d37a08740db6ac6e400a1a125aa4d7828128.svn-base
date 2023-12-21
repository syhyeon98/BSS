package kr.or.ddit.edApproval.fancytree;

import java.util.List;

/**
 * FancyTreeNode 의 메서드
 * @see <a href='https://wwwendt.de/tech/fancytree/doc/jsdoc/FancytreeNode.html'>FancyTreeNode API document</a>
 */
public interface FancyTreeNode2<T> { 
	public String getTitle();
	public String getKey();
	public boolean isFolder();
	public boolean isLazy();
	public T getData();
	public String getType();
	
	public default List<FancyTreeNode2<?>> getChildren() {
		return null;
	}
	
	public default FancyTreeNode2<?> getParent() {
		return null;
	}
	
	
	// 트리 메서드 설명
//	getTitle(): DB에서 가져온 데이터를 기반으로 노드의 제목을 반환합니다. 이 값은 노드가 화면에 표시될 때 텍스트로 표시됩니다.
//	getKey(): DB에서 가져온 데이터를 기반으로 노드의 고유한 키 값을 반환합니다. 이 키 값은 노드를 식별하는 데 사용되며, 특정 노드를 구별하는 역할을 합니다.
//	isFolder(): 가져온 데이터가 폴더(부모) 노드인지 아닌지를 나타내는 부울 값을 반환합니다. 만약 데이터가 폴더인 경우 하위 노드를 가질 수 있으며, 폴더 아이콘이 표시됩니다.
//	isLazy(): isFolder()와 유사하게 가져온 데이터가 폴더 노드인지 아닌지를 나타내는 부울 값을 반환합니다. 기본적으로 isLazy()는 isFolder()와 같은 값을 반환하도록 구현되어있으며, 폴더 노드일 경우 하위 노드를 지연 로드할 수 있도록 합니다.
//	getData(): 가져온 데이터를 반환합니다. 이 메서드를 통해 노드와 연관된 실제 데이터를 가져올 수 있습니다.
//	getType(): 노드의 유형을 나타내는 문자열 값을 반환합니다. 이 메서드는 보통 노드의 클래스명 등을 반환하여 노드 유형을 구분하는 용도로 사용됩니다.
//	getChildren() : 부모노드에서 자식노드 지정(?)할 때 사용!
	
	// 현재 상황 기준으로 설명
//	getTitle(): 부서의 이름이나 사람의 이름을 반환합니다.
//	getKey(): 부서나 사람의 고유한 식별자를 반환합니다.
//	isFolder(): 부서인 경우 true를 반환하여 하위 노드가 있음을 나타냅니다. 사람인 경우 false를 반환하여 하위 노드가 없음을 나타냅니다.
//	isLazy(): 부서인 경우 true를 반환하여 하위 노드를 지연 로드할 수 있음을 나타냅니다. 사람인 경우 false를 반환합니다.
//	getData(): 부서나 사람의 정보를 반환합니다. 예를 들어, 부서의 경우 부서 정보를 담고 있는 객체를 반환하고, 사람의 경우 사람 정보를 담고 있는 객체를 반환합니다.
//	getType(): 부서인지 사람인지를 구분하는 값을 반환합니다. 예를 들어, 부서인 경우 "department"를, 사람인 경우 "person"을 반환하도록 구현할 수 있습니다.
//	getChildren() : 부모노드에서 자식노드 지정(?)할 때 사용!	

	
}
