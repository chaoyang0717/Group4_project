package order.category;

import edu.pccu.student.*;
import java.util.ArrayList;

public interface MemberDAO {
    public void add(Member member);
    public void update(Member member);
    public void remove(Member member);
    public Member findById(String member_id);
    public ArrayList<Member> getAllMembers();        
    public ArrayList<Member> getRangeMembers(int start, int size);
    public Member findByAccount(String member_account);
    public int getSize();
}
