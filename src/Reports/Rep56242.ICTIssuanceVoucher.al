report 56242 "ICT Issuance Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ICT Issuance Voucher.rdlc';

    dataset
    {
        dataitem("ICT Issuance Voucher"; "ICT Issuance Voucher")
        {
            column(COMPANY; CompanyInfo.Name)
            {
            }
            column(logo; CompanyInfo.Picture)
            {
            }
            column(PostCode; CompanyInfo."Post Code")
            {
            }
            column(City; CompanyInfo.City)
            {
            }
            column(Address; CompanyInfo.Address)
            {
            }
            column(Address2; CompanyInfo."Address 2")
            {
            }
            column(No_ICTIssuanceVoucher; "ICT Issuance Voucher"."No.")
            {
            }
            column(IssuedToUserID_ICTIssuanceVoucher; "ICT Issuance Voucher"."Issued To User ID")
            {
            }
            column(IssuedToNo_ICTIssuanceVoucher; "ICT Issuance Voucher"."Issued To No.")
            {
            }
            column(Name_ICTIssuanceVoucher; "ICT Issuance Voucher".Name)
            {
            }
            column(IssuedDate_ICTIssuanceVoucher; "ICT Issuance Voucher"."Issued Date")
            {
            }
            column(Description_ICTIssuanceVoucher; "ICT Issuance Voucher".Description)
            {
            }
            column(BranchesCode_ICTIssuanceVoucher; "ICT Issuance Voucher"."Branches Code")
            {
            }
            column(Directorate_ICTIssuanceVoucher; "ICT Issuance Voucher".Directorate)
            {
            }
            column(Department_ICTIssuanceVoucher; "ICT Issuance Voucher".Department)
            {
            }
            column(DivisionUnit_ICTIssuanceVoucher; "ICT Issuance Voucher"."Division/Unit")
            {
            }
            column(Status_ICTIssuanceVoucher; "ICT Issuance Voucher".Status)
            {
            }
            column(LocationCode_ICTIssuanceVoucher; "ICT Issuance Voucher"."Location Code")
            {
            }
            column(IssuedBy_ICTIssuanceVoucher; "ICT Issuance Voucher"."Issued By")
            {
            }
            column(NoSeries_ICTIssuanceVoucher; "ICT Issuance Voucher"."No.Series")
            {
            }
            column(RequisitionOfficer; UserSetup."Employee Name")
            {
            }
            column(DateRequisitionOfficer; ApproverDate[1])
            {
            }
            column(RequisitionOfficer_Signature; UserSetup.Picture)
            {
            }
            column(AuthorisingOfficer; UserSetup2."Employee Name")
            {
            }
            column(DateAuthorisingOfficer; ApproverDate[2])
            {
            }
            column(AuthorisingOfficer_Signature; UserSetup2.Picture)
            {
            }
            column(IssuedBy; UserSetup3."Employee Name")
            {
            }
            column(DateIssuedBy; ApproverDate[3])
            {
            }
            column(IssuedBy_Signature; UserSetup3.Picture)
            {
            }
            column(AuthorizedBy; UserSetup4."Employee Name")
            {
            }
            column(DateAuthorizedBy; ApproverDate[4])
            {
            }
            column(AuthorizedBy_Signature; UserSetup4.Picture)
            {
            }
            column(Designation; Designation)
            {
            }
            dataitem("ICT Issuance Voucher Lines"; "ICT Issuance Voucher Lines")
            {
                DataItemLink = "No." = field("No.");
                column(No_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."No.")
                {
                }
                column(Code_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines".Code)
                {
                }
                column(Description_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines".Description)
                {
                }
                column(SerialNo_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Serial No.")
                {
                }
                column(DurationofUsestartdate_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Duration of Use start date")
                {
                }
                column(DurationofUseenddate_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Duration of Use end date")
                {
                }
                column(DurationofUse_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Duration of Use")
                {
                }
                column(FANo_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."FA No")
                {
                }
                column(ReasonForMovement_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Reason For Movement")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                //Approvals Signatures
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 56061);
                ApprovalEntries.SetRange("Document No.", ICTIssuanceVoucher."No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver1[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver1[1]) then begin
                                UserSetup.CalcFields(Picture);

                                ENo := UserSetup."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                JOBID.Reset;
                                JOBID.SetRange("Job Id", DesignationID);
                                if JOBID.FindSet then
                                    Designation := JOBID."Task No";

                            end;
                            Approver1[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver1[2]) then begin
                                UserSetup1.CalcFields(Picture);
                                ENo := UserSetup1."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                JOBID.Reset;
                                JOBID.SetRange("Job Id", DesignationID);
                                if JOBID.FindSet then
                                    Designation := JOBID."Task No";
                            end;
                        end;
                        if i = 2 then begin
                            Approver1[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver1[3]) then begin
                                UserSetup2.CalcFields(Picture);
                                ENo := UserSetup2."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                JOBID.Reset;
                                JOBID.SetRange("Job Id", DesignationID);
                                if JOBID.FindSet then
                                    Designation := JOBID."Task No";
                            end;
                        end;
                        if i = 3 then begin
                            Approver1[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver1[4]) then begin
                                UserSetup3.CalcFields(Picture);
                                ENo := UserSetup3."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                JOBID.Reset;
                                JOBID.SetRange("Job Id", DesignationID);
                                if JOBID.FindSet then
                                    Designation := JOBID."Task No";
                            end;
                        end;
                    until
                   ApprovalEntries.Next = 0;
                end;
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        SerialNo: Integer;
        ICTIssuanceVoucher: Record "ICT Issuance Voucher";
        CompanyInfo: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        Emp: Record Employee;
        DesignationID: Code[50];
        USetup: Record "User Setup";
        ENo: Code[10];
        Designation: Code[50];
        JOBID: Record "ManPower Planning Lines";
        Approver1: array[10] of Code[50];
}

