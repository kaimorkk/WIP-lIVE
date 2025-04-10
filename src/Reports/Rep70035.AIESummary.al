report 70035 "AIE Summary"
{
    Caption = 'AIE Summary';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/AIESummary.rdlc';
    dataset
    {
        dataitem(BatchAuthtoIncurExpend; "Batch. Auth to Incur Expend")
        {
            column(Quarter; Quarter)
            {
            }
            column(QuarterEndDate; "Quarter End Date")
            {
            }
            column(QuarterStartDate; "Quarter Start Date")
            {
            }
            column(BudgetCode; "Budget Code")
            {
            }
            column(AmounttoAuthorize; "Amount to Authorize")
            {
            }
            //PV Approved By
            column(PVPreparedBy; UserSetup.GetFullName(PVApprovers[1]."User ID"))
            {
            }
            column(PVPreparedByDesignation; PVApprovers[1]."User ID")
            {
            }
            column(PVPreparedBySignature; PVApprovers[1]."User Signature")
            {
            }
            column(PVPreparedDate; Format(PVApprovalDates[1], 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            //Checked By
            column(PVCheckedBy; UserSetup.GetFullName(PreparedByUser))
            {
            }
            column(PVCheckedByDesignation; PVApprovers[2]."User ID")
            {
            }
            column(PVCheckedBySignature; PVApprovers[2]."User Signature")
            {
            }
            column(PVCheckedByDate; Format(PVApprovalDates[2], 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            //Approved  By
            column(PVApprovedBy; UserSetup.GetFullName(CheckedByUser))
            {
            }
            column(PVApprovedByByDesignation; PVApprovers[3]."User ID")
            {
            }
            column(PVApprovedBySignature; PVApprovers[3]."User Signature")
            {
            }
            column(PVApprovedByDate; Format(PVApprovalDates[3], 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            dataitem("Auth. Inc. Expend. Header"; "Auth. Inc. Expend. Header")
            {
                DataItemLink = "Batch No." = field("No.");
                //DataItemTableView = where("Global Dimension 1 Code" = filter(<> '00000001'));
                column(AmounttoAuthorize_AuthIncExpendHeader; "Amount to Authorize")
                {
                }
                column(GlobalDimension1Code_AuthIncExpendHeader; "Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_AuthIncExpendHeader; "Global Dimension 2 Code")
                {
                }
                column(No_AuthIncExpendHeader; "No.")
                {
                }
                column(DimName; DimName)
                {
                }
                trigger OnPreDataItem()
                begin
                    if not IncludeSupreme then
                        SetFilter("Global Dimension 1 Code", '<>%1', '00000001');
                end;

                trigger OnAfterGetRecord()
                begin
                    Calcfields("Amount to Authorize");
                    dimvar.Reset();
                    dimvar.SetRange("Global Dimension No.", 2);
                    dimvar.SetRange("Code", "Global Dimension 2 Code");
                    if dimvar.FindFirst() then begin
                        DimName := dimvar.Name;
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            var
                ApprovalsMgt: Codeunit "Custom Approvals Codeunit";
            begin
                ApprovalsMgt.GetDocApprovers(BatchAuthtoIncurExpend.RecordId, PVApprovers[1], PVApprovers[2], PVApprovers[3], PVApprovalDates);
                getApprovers();

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(IncludeSupreme; IncludeSupreme)
                    {
                        ApplicationArea = All;
                        Caption = 'Include Supreme';
                        ToolTip = 'Include Supreme Court Geolocation in the report';
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        dimvar: Record "Dimension Value";
        DimName: Text[50];
        IncludeSupreme: Boolean;
        PVApprovers: array[3] of Record "User Setup";
        PVApprovalDates: array[3] of DateTime;
        UserSetup: Record "User Setup";
        OTPRec1: Record Otp;
        OTPRec2: Record Otp;
        OTPRec3: Record Otp;
        PreparedByUser: Text;
        CheckedByUser: Text;
        ApprovalEntries: Record "Approval Entry";
        i: Integer;
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";

    local procedure getApprovers()
    begin
        ApprovalEntries.Reset;
        ApprovalEntries.SetRange("Table ID", 50108);
        ApprovalEntries.SetRange("Document No.", BatchAuthtoIncurExpend."No.");
        ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
        if ApprovalEntries.FindSet() then begin
            i := 0;
            repeat
                i := i + 1;
                if i = 1 then begin
                    Approver[1] := ApprovalEntries."Sender ID";
                    ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                    if UserSetup.Get(Approver[1]) then
                        UserSetup.CalcFields(Picture);
                    OTPRec1.reset();
                    OTPRec1.SetRange("Document No", BatchAuthtoIncurExpend."No.");
                    OTPRec1.SetRange("Table ID", 57000);
                    OTPRec1.SetRange("User ID", ApprovalEntries."Approver ID");
                    if OTPRec1.FindLast() then Begin
                        OTPRec1.CALCFIELDS("Approval QR Code");
                        PreparedByUser := OTPRec1."User ID";
                    end;


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
                    OTPRec2.reset();
                    OTPRec2.SetRange("Document No", BatchAuthtoIncurExpend."No.");
                    OTPRec2.SetRange("Table ID", 57000);
                    OTPRec2.SetRange("User ID", ApprovalEntries."Approver ID");
                    if OTPRec2.FindLast() then begin
                        CheckedByUser := OTPRec2."User ID";
                        OTPRec2.CALCFIELDS("Approval QR Code");
                    end;
                end;

                if i = 3 then begin
                    Approver[4] := ApprovalEntries."Approver ID";
                    ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                    if UserSetup3.Get(Approver[4]) then
                        UserSetup3.CalcFields(Picture);
                    OTPRec3.reset();
                    OTPRec3.SetRange("Document No", BatchAuthtoIncurExpend."No.");
                    OTPRec3.SetRange("Table ID", 57000);
                    OTPRec3.SetRange("User ID", ApprovalEntries."Approver ID");
                    if OTPRec3.Find('-') then
                        OTPRec3.CALCFIELDS("Approval QR Code");

                end;
            until
           ApprovalEntries.Next = 0;
        end;
    end;

}
