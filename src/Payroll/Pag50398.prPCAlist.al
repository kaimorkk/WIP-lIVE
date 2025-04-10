page 52193645 "prPCA list"
{
    CardPageID = prPayChangeAdvice;
    PageType = List;
    SourceTable = "prBasic pay PCA";
    SourceTableView = where("Document Type" = filter(PCA));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EmployeeCode; "Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(BasicPay; "Basic Pay")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Comments)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(PayrollPeriod; "Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field(ChangeAdviceSerialNo; "Change Advice Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field(Effected; Effected)
                {
                    ApplicationArea = Basic;
                }
                field(PAyrollCode; PAyrollCode)
                {
                    ApplicationArea = Basic;
                }
                field("Final Approver Status"; Rec."Final Approver Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Final Approver Status field.';
                }
                field("Open Approver Count"; Rec."Open Approver Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Open Approver Count field.';
                }
                field("Final Approver Seq No"; Rec."Final Approver Seq No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Final Approver Seq No field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control3; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control2; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control1; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RefreshApproval)
            {
                Caption = 'Refresh Approval';
                Image = RefreshVoucher;

                ApplicationArea = Basic;

                trigger OnAction()
                var

                begin
                    Validate(Status);
                    modify;
                    Message('Successful');
                end;
            }
            action(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;

                ApplicationArea = Basic;

                trigger OnAction()
                var
                    UserRec: Record "User Setup";
                begin
                    if UserRec.Get(UserId) then begin
                        if UserRec."Approval Administrator" = false then
                            Error('You do not have rights to release this document');
                        if ("Open Approver Count" > 0) then
                            Status := Status::"Pending Approval";
                        modify;
                        Message('Successful');
                    end else
                        Error('You do not have rights to release this document');
                end;
            }
            action(Release1)
            {
                Caption = 'Refresh';
                Image = Refresh;

                ApplicationArea = Basic;

                trigger OnAction()
                var
                    UserRec: Record "User Setup";
                begin
                    if UserRec.Get(UserId) then begin
                        if UserRec."Approval Administrator" = false then
                            Error('You do not have rights to release this document');
                        if ("Open Approver Count" = 0) and ("Final Approver Status" = "Final Approver Status"::Approved) then
                            Status := Status::Approved;
                        modify;
                        Message('Successful');
                    end else
                        Error('You do not have rights to release this document');
                end;
            }


        }
    }
    trigger OnOpenPage()
    begin
        if Rec.Status <> Rec.Status::Posted then
            Rec.SetFilter(Rec."User ID", UserId)
        else
            Rec.SetFilter("Posted By", UserId);
    end;

    var
        objOcx: Codeunit "PR Payroll Processing";
        ApprovalEntry: Record "Approval Entry";
        Text19057798: label 'e.g   C:\monte\Timesheets\main folder\';
        Text19037672: label 'e.g   E:\monte\Back Up\Timesheets\';
        Text19075848: label 'NB:  if ticked, system deletes the imported files from the "Primary Directory"';
        Text19036653: label 'To view imported details, go to: "Salary Card" > "Other Info" > "Cost Centers"';
}

