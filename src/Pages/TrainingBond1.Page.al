Page 52194168 "Training Bond1"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Training Bond1";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestNo; "Request No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(TraineeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Trainee Name';
                    Editable = false;
                }
                field(EmployeeAddress; "Employee Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TrainingInsitution; "Training Insitution")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                label(Control1000000010)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19064596;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(FirstSurety; "First Surety")
                {
                    ApplicationArea = Basic;
                    Caption = 'First Surety';
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                    Caption = 'Address';
                }
                field(IDNumber; "ID No.1")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID Number';
                }
                field(Telephone1; Telephone1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Telephone';
                }
                label(Control1000000016)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19050963;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(SecondSurety; "Second Surety")
                {
                    ApplicationArea = Basic;
                }
                field(Address2; Address2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Address';
                }
                field(IDNO2; "ID NO.2")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID Number';
                }
                field(Telephone2; Telephone2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Telephone';
                }
                field(IDNO; "ID NO")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID Number';
                }
                field(TrainingCost; "Total Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Cost';
                    Editable = false;
                }
                field(Duration; "No of Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Duration';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(PrintTrainingBond)
            {
                ApplicationArea = Basic;
                Caption = 'Print Training Bond';

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("Request No.", "Request No.");
                    Report.Run(51511208, true, true, Rec);
                    Reset;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(PrintTrainingBond_Promoted; PrintTrainingBond)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetRange("User Id", UserId);
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        D: Date;
        Text19064596: label 'First Surety';
        Text19050963: label 'Second Surety';
}

