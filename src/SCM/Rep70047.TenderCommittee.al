report 70047 "Tender Committee"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Tender Committee.rdlc';

    dataset
    {
        dataitem("IFS Tender Committee"; "IFS Tender Committee")
        {
            column(logo; corec.Picture)
            {
            }
            column(company_name; corec.Name)
            {
            }
            column(Descriptions; Descriptions)
            {

            }
            column(ChiefName; ChiefName)
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
            dataitem("IFS Tender Committee Member"; "IFS Tender Committee Member")
            {
                DataItemLink = "Document No." = field("Document No.");
                column(DocumentNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Document No.")
                {
                }
                column(Designation; Designation)
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
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                    TenderCommitee: Record "IFS Tender Committee";

                begin
                    Designation := '';
                    // if "IFS Tender Committee Member"."Document No." = '' then
                    //     CurrReport.Skip();
                    // EmployeeRec.Reset();
                    // EmployeeRec.SetRange("No.", "IFS Tender Committee Member"."Member No.");
                    // if EmployeeRec.FindFirst() then
                    //     Designation := EmployeeRec."Job Title";
                    // TenderCommitee.Reset();
                    // TenderCommitee.SetRange("Document No.", "IFS Tender Committee"."Document No.");

                end;
            }
            dataitem("Procurement Committee Function"; "Procurement Committee Function")
            {
                DataItemLink = "Committee Type" = field("Committee Type");
                column(CommitteeType_ProcurementCommitteeFunction; "Procurement Committee Function"."Committee Type")
                {
                }
                column(EntryNo_ProcurementCommitteeFunction; "Procurement Committee Function"."Entry No.")
                {
                }
                column(Description_ProcurementCommitteeFunction; "Procurement Committee Function".Description)
                {
                }
                column(SerialNo; SerialNo)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if "Procurement Committee Function".Description <> '' then
                        SerialNo += 1;
                end;
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                IfsTenders: Record "IFS Tender Committee";
            begin
                ChiefName := '';
                Descriptions := '';
                IfsTenders.Reset();
                IfsTenders.SetRange("Document No.", "IFS Tender Committee"."Document No.");
                if IfsTenders.FindFirst() then begin
                    if IfsTenders."Committee Type" = 'EVALUATION' then
                        Descriptions := 'Pursuant to section 46(4) and section 80 of the Public Procurement & Asset Disposal (2015),You have been appointed as a member of the Tender EVALUATION committee for the following tender:'
                    else
                        if IfsTenders."Committee Type" = 'OPENING' then
                            Descriptions := 'Pursuant to section 78 of the Public Procurement & Asset Disposal (2015),You have been appointed as a member of the Tender Opening committee for the following tender:'
                        else
                            if IfsTenders."Committee Type" = 'INSPECTION' then
                                Descriptions := 'Pursuant to section 48 of the Public Procurement & Asset Disposal Act (2015) and regulation 35' +
                                ' ' + ' of the Public Procurement & Asset Disposal Regulations, (2020), you have been appointed as a member of the Inspection and Acceptance Committee to Inspect below tender As an Ad hoc Committee, you are expected to Inspect, Accept or Reject goods, works or services in order to ensure compliance with the terms and' +
                                ' ' + 'specifications of the contract and submit the Inspection and Acceptance Report as and when required.You are also requested to take note of provisions of Section 150 (3) of PPADA, 2015.';
                end;
                ApproralEntry.Reset();
                ApproralEntry.SetRange("Document No.", "IFS Tender Committee"."Document No.");
                ApproralEntry.SetRange(Status, ApproralEntry.Status::Approved);
                if ApproralEntry.FindFirst() then begin
                    EmployeeRec.Reset();
                    EmployeeRec.SetRange("User ID", ApproralEntry."Approver ID");
                    if EmployeeRec.Find('-') then
                        ChiefName := EmployeeRec.FullName();
                end;
                if "IFS Tender Committee"."Document No." = '' then
                    CurrReport.Skip();

            end;

            // trigger OnPreDataItem()
            // begin
            //     corec.GET;
            //     corec.CalcFields(corec.Picture);
            // end;
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
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        corec.GET;
        corec.CalcFields(corec.Picture);
    end;

    var
        corec: Record "Company Information";
        SerialNo: Integer;
        Descriptions: Text;
        EmployeeRec: Record Employee;
        Designation: Text;
        ApproralEntry: Record "Approval Entry";
        ChiefName: Text;
}

