Page 52193568 "Standing Orders"
{
    PageType = Card;
    SourceTable = "Standing Orders";
    SourceTableView = where(Status = filter(<> Active));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SourceAccountNo; "Source Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName; "Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(DestinationAccountType; "Destination Account Type")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        "Bank CodeVisible" := false;
                        "Destination Account No.Visible" := false;
                        "BOSA STOVisible" := false;
                        "BOSA Account No.Visible" := false;


                        if "Destination Account Type" = "destination account type"::" " then
                            "Destination Account No.Visible" := true
                        else
                            if "Destination Account Type" = "destination account type"::Internal then
                                "Bank CodeVisible" := true
                            else
                                if "Destination Account Type" = "destination account type"::External then begin
                                    "BOSA STOVisible" := true;
                                    "BOSA Account No.Visible" := true;
                                end;
                    end;
                }
                field(BOSAAccountNo; "BOSA Account No.")
                {
                    ApplicationArea = Basic;
                    Visible = "BOSA Account No.Visible";
                }
                field(BankCode; "Bank Code")
                {
                    ApplicationArea = Basic;
                    Visible = "Bank CodeVisible";
                }
                field(DestinationAccountNo; "Destination Account No.")
                {
                    ApplicationArea = Basic;
                    Visible = "Destination Account No.Visible";
                }
                field(DestinationAccountName; "Destination Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(EffectiveStartDate; "Effective/Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Duration)
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Frequency; Frequency)
                {
                    ApplicationArea = Basic;
                }
                field(DontAllowPartialDeduction; "Don't Allow Partial Deduction")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Control1102760027; Status)
                {
                    ApplicationArea = Basic;
                }
                field(AllocatedAmount; "Allocated Amount")
                {
                    ApplicationArea = Basic;
                }
                group("BOSA STO")
                {
                    Caption = 'BOSA STO';
                    Visible = "BOSA STOVisible";
                    field(Unsuccessfull; Unsuccessfull)
                    {
                        ApplicationArea = Basic;
                    }
                    field(Balance; Balance)
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000001; Links)
            {
                Visible = true;
            }
            systempart(Control1000000000; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Status)
            {
                Caption = 'Status';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //******************************End Then Send For Approval
                        //ApprovalMgt.AppraisalRelease(Rec)
                        //******************************End of Code
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ////if ApprovalMgt.FinishApprovalEntryAppraisal(Rec, true, true) then;
                    end;
                }
                separator(Action1102760040)
                {
                }
                action(Stop)
                {
                    ApplicationArea = Basic;
                    Caption = 'Stop';

                    trigger OnAction()
                    begin
                        StatusPermissions.Reset;
                        StatusPermissions.SetRange(StatusPermissions."User ID", UserId);
                        StatusPermissions.SetRange(StatusPermissions."Function", StatusPermissions."function"::"Standing Order");
                        if StatusPermissions.Find('-') = false then
                            Error('You do not have permissions to change the account status.');

                        if Confirm('Are you sure you want to stop the standing order?', false) = true then begin
                            Status := Status::Released;
                            Modify;
                        end;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Stop_Promoted; Stop)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        BankName := '';
        if Banks.Get("Bank Code") then
            BankName := Banks."Bank Name";
        "Destination Account No.Visible" := false;
        "Bank CodeVisible" := false;
        "BOSA Account No.Visible" := false;
        "BOSA STOVisible" := false;
        if "Destination Account Type" = "destination account type"::" " then
            "Destination Account No.Visible" := true
        else
            if "Destination Account Type" = "destination account type"::Internal then
                "Bank CodeVisible" := true
            else
                if "Destination Account Type" = "destination account type"::External then begin
                    "BOSA Account No.Visible" := true;
                    "BOSA STOVisible" := true;
                end;
    end;

    trigger OnInit()
    begin
        "BOSA STOVisible" := true;
        "BOSA Account No.Visible" := true;
        "Bank CodeVisible" := true;
        "Destination Account No.Visible" := true;
    end;

    trigger OnOpenPage()
    begin
        if UsersID.Get(UserId) then begin
            if UsersID.Branch <> '' then
                SetRange("Transacting Branch", UsersID.Branch);
        end;


        "Destination Account No.Visible" := false;
        "Bank CodeVisible" := false;
        "BOSA Account No.Visible" := false;
        "BOSA STOVisible" := false;
        if "Destination Account Type" = "destination account type"::" " then
            "Destination Account No.Visible" := true
        else
            if "Destination Account Type" = "destination account type"::Internal then
                "Bank CodeVisible" := true
            else
                if "Destination Account Type" = "destination account type"::External then begin
                    "BOSA Account No.Visible" := true;
                    "BOSA STOVisible" := true;
                end;
    end;

    var
        StatusPermissions: Record "Status Change Permisions";
        BankName: Text[200];
        Banks: Record Banks;
        UsersID: Record "User Setup";

        "Destination Account No.Visible": Boolean;

        "Bank CodeVisible": Boolean;

        "BOSA Account No.Visible": Boolean;

        "BOSA STOVisible": Boolean;
}

