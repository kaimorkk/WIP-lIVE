page 96034 "Approved Licence Restorations"
{
    ApplicationArea = All;
    Caption = 'Approved Licence Restorations';
    PageType = List;
    SourceTable = "Licence Registration Form";
    UsageCategory = None;
    Editable = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where("Application Type" = filter(Restoration), Status = filter(Approved), Closed = filter(false));
    RefreshOnActivate = true;
    CardPageId = "Licence Restoration Form";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("Full Name"; fullName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.', Comment = '%';
                }
                field("ID Number"; idNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.', Comment = '%';
                }
                field("Phone No."; phone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field("E-mail"; email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Type field.', Comment = '%';
                }
                field("Current Occupation"; Rec."Current Occupation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Occupation field.', Comment = '%';
                }
                field("Current Residence"; Rec."Current Residence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Residence field.', Comment = '%';
                }
                field("Grounds of Application"; Rec."Grounds of Application")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grounds of Application field.', Comment = '%';
                }
                field("Deregistration No."; Rec."Deregistration No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Deregistration No. field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                }
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Submission Date field.', Comment = '%';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice No. field.', Comment = '%';
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Status field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.', Comment = '%';
                }
                field("Amount Received"; Rec."Amount Received")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount Received field.', Comment = '%';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.', Comment = '%';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed By field.', Comment = '%';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transaction Code field.', Comment = '%';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transaction Date field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                }
                field("Last DateTime Modified"; Rec."Last DateTime Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last DateTime Modified field.', Comment = '%';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance();
    end;

    trigger OnInit()
    begin
        SetControlAppearance();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Application Type" := Rec."Application Type"::Restoration;
    end;

    var
        Users: Record "Licensing Portal Users";
        fullName: Text;
        email: Text;
        phone: Text;
        idNo: Text;

    local procedure SetControlAppearance()
    begin
        Users.Reset();
        Users.SetRange("User ID", Rec."User ID");
        if Users.FindFirst() then begin
            fullName:= Users.FullName();
            email:= Users."E-Mail";
            phone:= Users."Phone No.";
            idNo:= Users."ID Number";
        end;
    end;
}
