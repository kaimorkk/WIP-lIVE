report 70048 "Tender Committee appointment"
{
    DefaultLayout = RDLC;
    // RDLCLayout = './Layouts/Tender Committee appointment.rdlc';
    RDLCLayout = './Layouts/Tender Committee appointment2.rdlc';

    dataset
    {
        dataitem("IFS Tender Committee"; "IFS Tender Committee")
        {
            column(logo; corec.Picture)
            {
            }
            column(CompanyName;corec.Name)
            {
            }
            column(CompanyName2; corec."Name 2")
            {
            }
            column(CompanyAddress; corec.Address)
            {
            }
            column(CompanyAddress2; corec."Address 2")
            {
            }
            column(CompanyEmail; corec."E-Mail")
            {
            }
            column(CompanyPhone; corec."Phone No.")
            {
            }
            column(CompanyPostCode; corec."Post Code")
            {
            }
            column(CompanyCity; corec.City)
            {
            }
            column(CompanyHeadName; CompanyHeadName)
            {
            }
            column(CompanyHeadTitle; CompanyHeadTitle)
            {
            }
            column(DocumentNo_IFSTenderCommittee; "IFS Tender Committee"."Document No.")
            {
            }
            column(CommitteeType_IFSTenderCommittee; "IFS Tender Committee"."Committee Type")
            {
            }
            column(Description_IFSTenderCommittee; "IFS Tender Committee".Description)
            {
            }
            column(AppointmentEffectiveDate_IFSTenderCommittee; "IFS Tender Committee"."Appointment Effective Date")
            {
            }
            column(AppointingAuthority_IFSTenderCommittee; "IFS Tender Committee"."Appointing Authority")
            {
            }
            column(TenderName_IFSTenderCommittee; "IFS Tender Committee"."Tender Name")
            {
            }
            column(ApprovalStatus_IFSTenderCommittee; "IFS Tender Committee"."Approval Status")
            {
            }
            column(PrimaryRegion_IFSTenderCommittee; "IFS Tender Committee"."Primary Region")
            {
            }
            column(PrimaryDirectorate_IFSTenderCommittee; "IFS Tender Committee"."Primary Directorate")
            {
            }
            column(PrimaryDepartment_IFSTenderCommittee; "IFS Tender Committee"."Primary Department")
            {
            }
            column(Blocked_IFSTenderCommittee; "IFS Tender Committee".Blocked)
            {
            }
            column(NoSeries_IFSTenderCommittee; "IFS Tender Committee"."No. Series")
            {
            }
            column(CreatedBy_IFSTenderCommittee; "IFS Tender Committee"."Created By")
            {
            }
            column(CreatedDate_IFSTenderCommittee; "IFS Tender Committee"."Created Date")
            {
            }
            column(CreatedTime_IFSTenderCommittee; "IFS Tender Committee"."Created Time")
            {
            }
            column(IFSCode_IFSTenderCommittee; "IFS Tender Committee"."IFS Code")
            {
            }
            column(DocumentDate_IFSTenderCommittee; "IFS Tender Committee"."Document Date")
            {
            }
            column(DocumentStatus_IFSTenderCommittee; "IFS Tender Committee"."Document Status")
            {
            }
            column(ContractNo_IFSTenderCommittee; "IFS Tender Committee"."Contract No.")
            {
            }
            column(ExternalDocumentNo_IFSTenderCommittee; "IFS Tender Committee"."External Document No")
            {
            }
            column(RaisedBy_IFSTenderCommittee; "IFS Tender Committee"."Raised By")
            {
            }
            column(Name_IFSTenderCommittee; "IFS Tender Committee".Name)
            {
            }
            column(StaffId_IFSTenderCommittee; "IFS Tender Committee"."Staff Id")
            {
            }
            column(Designation_IFSTenderCommittee; "IFS Tender Committee".Designation)
            {
            }
            column(MinRequiredNoofMembers_IFSTenderCommittee; "IFS Tender Committee"."Min Required No. of Members")
            {
            }
            column(ActualNoofCommitteeMemb_IFSTenderCommittee; "IFS Tender Committee"."Actual No. of Committee Memb")
            {
            }
            column(IFSDates; IFSDates)
            {
            }
            column(IFSTime; IFSTime)
            {
            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateExamined; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            dataitem("IFS Tender Committee Member"; "IFS Tender Committee Member")
            {
                DataItemLink = "Document No." = field("Document No.");
                column(DocumentNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Document No.")
                {
                }
                column(CommitteeType_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Committee Type")
                {
                }
                column(LineNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Line No")
                {
                }
                column(Role_IFSTenderCommitteeMember; "IFS Tender Committee Member".Role)
                {
                }
                column(MemberNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Member No.")
                {
                }
                column(MemberName_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Member Name")
                {
                }
                column(Designation_IFSTenderCommitteeMember; "IFS Tender Committee Member".Designation)
                {
                }
                column(IDPassportNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Tax Registration (PIN) No.")
                {
                }
                column(MemberEmail_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Member Email")
                {
                }
                column(TelephoneNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Telephone No.")
                {
                }
                column(StaffNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Staff  No.")
                {
                }
                column(IFSCode_IFSTenderCommitteeMember; "IFS Tender Committee Member"."IFS Code")
                {
                }
                column(NotifiedonEmail_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Notified on Email")
                {
                }
                column(DateTimeNotified_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Date/Time Notified")
                {
                }
                column(Chairman; Chairman)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if "IFS Tender Committee Member".Role = "IFS Tender Committee Member".Role::Chairperson then
                        Chairman := "IFS Tender Committee Member"."Member Name";
                end;
            }

            trigger OnAfterGetRecord()
            begin
                IFS.Reset;
                IFS.SetRange(Code, "IFS Tender Committee"."IFS Code");
                if IFS.FindSet then begin
                    IFSDates := IFS."Bid Opening Date";
                    IFSTime := IFS."Bid Opening Time";
                end;
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 70141);
                ApprovalEntries.SetRange("Document No.", "IFS Tender Committee"."Document No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
            end;

            trigger OnPreDataItem()
            begin
                corec.Get;
                corec.CalcFields(Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        corec.Get;
        corec.CalcFields(Picture);

        Emp.Reset();
        Emp.SetRange("No.", corec."Company Head");
        if Emp.FindFirst() then begin
            CompanyHeadName := Emp.FullName();
            CompanyHeadTitle := Emp."Job Title";
        end;
    end;

    var
        corec: Record "Company Information";
        CompanyHeadName: Text;
        CompanyHeadTitle: Text;
        Emp: Record Employee;
        SerialNo: Integer;
        Chairman: Text[70];
        IFSDates: Date;
        IFS: Record "Standard Purchase Code";
        IFSTime: Time;
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
}

