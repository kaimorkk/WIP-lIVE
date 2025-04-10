page 96032 "Approved Licence Renewals"
{
    ApplicationArea = All;
    Caption = 'Approved License Renewals';
    PageType = List;
    SourceTable = "Licence Registration Form";
    UsageCategory = None;
    Editable = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where("Application Type" = filter(Renewal), Status = filter(Approved), Closed = filter(false));
    RefreshOnActivate = true;
    CardPageId = "Licence Renewal Form";
    
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
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
        Rec."Application Type" := Rec."Application Type"::Renewal;
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
