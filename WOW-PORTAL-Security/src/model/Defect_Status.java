package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "defect_status")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Defect_Status {

	@Id
	@Column(name = "unique_id")
	private int unique_id;

	@Column(name = "new_def_sev1")
	private int new_Def_Severity1;

	@Column(name = "new_def_sev2")
	private int new_Def_Severity2;

	@Column(name = "new_def_sev3")
	private int new_Def_Severity3;

	@Column(name = "new_def_sev4")
	private int new_Def_Severity4;

	@Column(name = "open_def_sev1")
	private int open_Def_Severity1;

	@Column(name = "open_def_sev2")
	private int open_Def_Severity2;

	@Column(name = "open_def_sev3")
	private int open_Def_Severity3;

	@Column(name = "open_def_sev4")
	private int open_Def_Severity4;

	@Column(name = "rejected_def_sev1")
	private int rejected_Def_Severity1;

	@Column(name = "rejected_def_sev2")
	private int rejected_Def_Severity2;

	@Column(name = "rejected_def_sev3")
	private int rejected_Def_Severity3;

	@Column(name = "rejected_def_sev4")
	private int rejected_Def_Severity4;

	@Column(name = "in_progress_def_sev1")
	private int inprogress_Def_Severity1;

	@Column(name = "in_progress_def_sev2")
	private int inprogress_Def_Severity2;

	@Column(name = "in_progress_def_sev3")
	private int inprogress_Def_Severity3;

	@Column(name = "in_progress_def_sev4")
	private int inprogress_Def_Severity4;

	@Column(name = "clarify_def_sev1")
	private int clarify_Def_Severity1;

	@Column(name = "clarify_def_sev2")
	private int clarify_Def_Severity2;

	@Column(name = "clarify_def_sev3")
	private int clarify_Def_Severity3;

	@Column(name = "clarify_def_sev4")
	private int clarify_Def_Severity4;

	@Column(name = "fixed_def_sev1")
	private int fixed_Def_Severity1;

	@Column(name = "fixed_def_sev2")
	private int fixed_Def_Severity2;

	@Column(name = "fixed_def_sev3")
	private int fixed_Def_Severity3;

	@Column(name = "fixed_def_sev4")
	private int fixed_Def_Severity4;

	@Column(name = "assigned_def_sev1")
	private int assigned_Def_Severity1;

	@Column(name = "assigned_def_sev2")
	private int assigned_Def_Severity2;

	@Column(name = "assigned_def_sev3")
	private int assigned_Def_Severity3;

	@Column(name = "assigned_def_sev4")
	private int assigned_Def_Severity4;

	@Column(name = "retest_def_sev1")
	private int retest_Def_Severity1;

	@Column(name = "retest_def_sev2")
	private int retest_Def_Severity2;

	@Column(name = "retest_def_sev3")
	private int retest_Def_Severity3;

	@Column(name = "retest_def_sev4")
	private int retest_Def_Severity4;

	@Column(name = "reopen_def_sev1")
	private int reopen_Def_Severity1;

	@Column(name = "reopen_def_sev2")
	private int reopen_Def_Severity2;

	@Column(name = "reopen_def_sev3")
	private int reopen_Def_Severity3;

	@Column(name = "reopen_def_sev4")
	private int reopen_Def_Severity4;

	@Column(name = "deferred_def_sev1")
	private int deferred_Def_Severity1;

	@Column(name = "deferred_def_sev2")
	private int deferred_Def_Severity2;

	@Column(name = "deferred_def_sev3")
	private int deferred_Def_Severity3;

	@Column(name = "deferred_def_sev4")
	private int deferred_Def_Severity4;

	@Column(name = "cancelled_def_sev1")
	private int cancelled_Def_Severity1;

	@Column(name = "cancelled_def_sev2")
	private int cancelled_Def_Severity2;

	@Column(name = "cancelled_def_sev3")
	private int cancelled_Def_Severity3;

	@Column(name = "cancelled_def_sev4")
	private int cancelled_Def_Severity4;

	@Column(name = "closed_def_sev1")
	private int closed_Def_Severity1;

	@Column(name = "closed_def_sev2")
	private int closed_Def_Severity2;

	@Column(name = "closed_def_sev3")
	private int closed_Def_Severity3;

	@Column(name = "closed_def_sev4")
	private int closed_Def_Severity4;

	public int getNew_Def_Severity1() {
		return new_Def_Severity1;
	}

	public void setNew_Def_Severity1(int new_Def_Severity1) {
		this.new_Def_Severity1 = new_Def_Severity1;
	}

	public int getNew_Def_Severity2() {
		return new_Def_Severity2;
	}

	public void setNew_Def_Severity2(int new_Def_Severity2) {
		this.new_Def_Severity2 = new_Def_Severity2;
	}

	public int getNew_Def_Severity3() {
		return new_Def_Severity3;
	}

	public void setNew_Def_Severity3(int new_Def_Severity3) {
		this.new_Def_Severity3 = new_Def_Severity3;
	}

	public int getNew_Def_Severity4() {
		return new_Def_Severity4;
	}

	public void setNew_Def_Severity4(int new_Def_Severity4) {
		this.new_Def_Severity4 = new_Def_Severity4;
	}

	public int getOpen_Def_Severity1() {
		return open_Def_Severity1;
	}

	public void setOpen_Def_Severity1(int open_Def_Severity1) {
		this.open_Def_Severity1 = open_Def_Severity1;
	}

	public int getOpen_Def_Severity2() {
		return open_Def_Severity2;
	}

	public void setOpen_Def_Severity2(int open_Def_Severity2) {
		this.open_Def_Severity2 = open_Def_Severity2;
	}

	public int getOpen_Def_Severity3() {
		return open_Def_Severity3;
	}

	public void setOpen_Def_Severity3(int open_Def_Severity3) {
		this.open_Def_Severity3 = open_Def_Severity3;
	}

	public int getOpen_Def_Severity4() {
		return open_Def_Severity4;
	}

	public void setOpen_Def_Severity4(int open_Def_Severity4) {
		this.open_Def_Severity4 = open_Def_Severity4;
	}

	public int getRejected_Def_Severity1() {
		return rejected_Def_Severity1;
	}

	public void setRejected_Def_Severity1(int rejected_Def_Severity1) {
		this.rejected_Def_Severity1 = rejected_Def_Severity1;
	}

	public int getRejected_Def_Severity2() {
		return rejected_Def_Severity2;
	}

	public void setRejected_Def_Severity2(int rejected_Def_Severity2) {
		this.rejected_Def_Severity2 = rejected_Def_Severity2;
	}

	public int getRejected_Def_Severity3() {
		return rejected_Def_Severity3;
	}

	public void setRejected_Def_Severity3(int rejected_Def_Severity3) {
		this.rejected_Def_Severity3 = rejected_Def_Severity3;
	}

	public int getRejected_Def_Severity4() {
		return rejected_Def_Severity4;
	}

	public void setRejected_Def_Severity4(int rejected_Def_Severity4) {
		this.rejected_Def_Severity4 = rejected_Def_Severity4;
	}

	public int getInprogress_Def_Severity1() {
		return inprogress_Def_Severity1;
	}

	public void setInprogress_Def_Severity1(int inprogress_Def_Severity1) {
		this.inprogress_Def_Severity1 = inprogress_Def_Severity1;
	}

	public int getInprogress_Def_Severity2() {
		return inprogress_Def_Severity2;
	}

	public void setInprogress_Def_Severity2(int inprogress_Def_Severity2) {
		this.inprogress_Def_Severity2 = inprogress_Def_Severity2;
	}

	public int getInprogress_Def_Severity3() {
		return inprogress_Def_Severity3;
	}

	public void setInprogress_Def_Severity3(int inprogress_Def_Severity3) {
		this.inprogress_Def_Severity3 = inprogress_Def_Severity3;
	}

	public int getInprogress_Def_Severity4() {
		return inprogress_Def_Severity4;
	}

	public void setInprogress_Def_Severity4(int inprogress_Def_Severity4) {
		this.inprogress_Def_Severity4 = inprogress_Def_Severity4;
	}

	public int getClarify_Def_Severity1() {
		return clarify_Def_Severity1;
	}

	public void setClarify_Def_Severity1(int clarify_Def_Severity1) {
		this.clarify_Def_Severity1 = clarify_Def_Severity1;
	}

	public int getClarify_Def_Severity2() {
		return clarify_Def_Severity2;
	}

	public void setClarify_Def_Severity2(int clarify_Def_Severity2) {
		this.clarify_Def_Severity2 = clarify_Def_Severity2;
	}

	public int getClarify_Def_Severity3() {
		return clarify_Def_Severity3;
	}

	public void setClarify_Def_Severity3(int clarify_Def_Severity3) {
		this.clarify_Def_Severity3 = clarify_Def_Severity3;
	}

	public int getClarify_Def_Severity4() {
		return clarify_Def_Severity4;
	}

	public void setClarify_Def_Severity4(int clarify_Def_Severity4) {
		this.clarify_Def_Severity4 = clarify_Def_Severity4;
	}

	public int getFixed_Def_Severity1() {
		return fixed_Def_Severity1;
	}

	public void setFixed_Def_Severity1(int fixed_Def_Severity1) {
		this.fixed_Def_Severity1 = fixed_Def_Severity1;
	}

	public int getFixed_Def_Severity2() {
		return fixed_Def_Severity2;
	}

	public void setFixed_Def_Severity2(int fixed_Def_Severity2) {
		this.fixed_Def_Severity2 = fixed_Def_Severity2;
	}

	public int getFixed_Def_Severity3() {
		return fixed_Def_Severity3;
	}

	public void setFixed_Def_Severity3(int fixed_Def_Severity3) {
		this.fixed_Def_Severity3 = fixed_Def_Severity3;
	}

	public int getFixed_Def_Severity4() {
		return fixed_Def_Severity4;
	}

	public void setFixed_Def_Severity4(int fixed_Def_Severity4) {
		this.fixed_Def_Severity4 = fixed_Def_Severity4;
	}

	public int getAssigned_Def_Severity1() {
		return assigned_Def_Severity1;
	}

	public void setAssigned_Def_Severity1(int assigned_Def_Severity1) {
		this.assigned_Def_Severity1 = assigned_Def_Severity1;
	}

	public int getAssigned_Def_Severity2() {
		return assigned_Def_Severity2;
	}

	public void setAssigned_Def_Severity2(int assigned_Def_Severity2) {
		this.assigned_Def_Severity2 = assigned_Def_Severity2;
	}

	public int getAssigned_Def_Severity3() {
		return assigned_Def_Severity3;
	}

	public void setAssigned_Def_Severity3(int assigned_Def_Severity3) {
		this.assigned_Def_Severity3 = assigned_Def_Severity3;
	}

	public int getAssigned_Def_Severity4() {
		return assigned_Def_Severity4;
	}

	public void setAssigned_Def_Severity4(int assigned_Def_Severity4) {
		this.assigned_Def_Severity4 = assigned_Def_Severity4;
	}

	public int getRetest_Def_Severity1() {
		return retest_Def_Severity1;
	}

	public void setRetest_Def_Severity1(int retest_Def_Severity1) {
		this.retest_Def_Severity1 = retest_Def_Severity1;
	}

	public int getRetest_Def_Severity2() {
		return retest_Def_Severity2;
	}

	public void setRetest_Def_Severity2(int retest_Def_Severity2) {
		this.retest_Def_Severity2 = retest_Def_Severity2;
	}

	public int getRetest_Def_Severity3() {
		return retest_Def_Severity3;
	}

	public void setRetest_Def_Severity3(int retest_Def_Severity3) {
		this.retest_Def_Severity3 = retest_Def_Severity3;
	}

	public int getRetest_Def_Severity4() {
		return retest_Def_Severity4;
	}

	public void setRetest_Def_Severity4(int retest_Def_Severity4) {
		this.retest_Def_Severity4 = retest_Def_Severity4;
	}

	public int getReopen_Def_Severity1() {
		return reopen_Def_Severity1;
	}

	public void setReopen_Def_Severity1(int reopen_Def_Severity1) {
		this.reopen_Def_Severity1 = reopen_Def_Severity1;
	}

	public int getReopen_Def_Severity2() {
		return reopen_Def_Severity2;
	}

	public void setReopen_Def_Severity2(int reopen_Def_Severity2) {
		this.reopen_Def_Severity2 = reopen_Def_Severity2;
	}

	public int getReopen_Def_Severity3() {
		return reopen_Def_Severity3;
	}

	public void setReopen_Def_Severity3(int reopen_Def_Severity3) {
		this.reopen_Def_Severity3 = reopen_Def_Severity3;
	}

	public int getReopen_Def_Severity4() {
		return reopen_Def_Severity4;
	}

	public void setReopen_Def_Severity4(int reopen_Def_Severity4) {
		this.reopen_Def_Severity4 = reopen_Def_Severity4;
	}

	public int getDeferred_Def_Severity1() {
		return deferred_Def_Severity1;
	}

	public void setDeferred_Def_Severity1(int deferred_Def_Severity1) {
		this.deferred_Def_Severity1 = deferred_Def_Severity1;
	}

	public int getDeferred_Def_Severity2() {
		return deferred_Def_Severity2;
	}

	public void setDeferred_Def_Severity2(int deferred_Def_Severity2) {
		this.deferred_Def_Severity2 = deferred_Def_Severity2;
	}

	public int getDeferred_Def_Severity3() {
		return deferred_Def_Severity3;
	}

	public void setDeferred_Def_Severity3(int deferred_Def_Severity3) {
		this.deferred_Def_Severity3 = deferred_Def_Severity3;
	}

	public int getDeferred_Def_Severity4() {
		return deferred_Def_Severity4;
	}

	public void setDeferred_Def_Severity4(int deferred_Def_Severity4) {
		this.deferred_Def_Severity4 = deferred_Def_Severity4;
	}

	public int getCancelled_Def_Severity1() {
		return cancelled_Def_Severity1;
	}

	public void setCancelled_Def_Severity1(int cancelled_Def_Severity1) {
		this.cancelled_Def_Severity1 = cancelled_Def_Severity1;
	}

	public int getCancelled_Def_Severity2() {
		return cancelled_Def_Severity2;
	}

	public void setCancelled_Def_Severity2(int cancelled_Def_Severity2) {
		this.cancelled_Def_Severity2 = cancelled_Def_Severity2;
	}

	public int getCancelled_Def_Severity3() {
		return cancelled_Def_Severity3;
	}

	public void setCancelled_Def_Severity3(int cancelled_Def_Severity3) {
		this.cancelled_Def_Severity3 = cancelled_Def_Severity3;
	}

	public int getCancelled_Def_Severity4() {
		return cancelled_Def_Severity4;
	}

	public void setCancelled_Def_Severity4(int cancelled_Def_Severity4) {
		this.cancelled_Def_Severity4 = cancelled_Def_Severity4;
	}

	public int getUnique_id() {
		return unique_id;
	}

	public void setUnique_id(int unique_id) {
		this.unique_id = unique_id;
	}

	public int getClosed_Def_Severity1() {
		return closed_Def_Severity1;
	}

	public void setClosed_Def_Severity1(int closed_Def_Severity1) {
		this.closed_Def_Severity1 = closed_Def_Severity1;
	}

	public int getClosed_Def_Severity2() {
		return closed_Def_Severity2;
	}

	public void setClosed_Def_Severity2(int closed_Def_Severity2) {
		this.closed_Def_Severity2 = closed_Def_Severity2;
	}

	public int getClosed_Def_Severity3() {
		return closed_Def_Severity3;
	}

	public void setClosed_Def_Severity3(int closed_Def_Severity3) {
		this.closed_Def_Severity3 = closed_Def_Severity3;
	}

	public int getClosed_Def_Severity4() {
		return closed_Def_Severity4;
	}

	public void setClosed_Def_Severity4(int closed_Def_Severity4) {
		this.closed_Def_Severity4 = closed_Def_Severity4;
	}

}
