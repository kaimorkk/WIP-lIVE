page 96013 "Licence Practice Categories"
{
    ApplicationArea = All;
    Caption = 'Practice Categories';
    PageType = List;
    SourceTable = "Licence Practice Categories";
    UsageCategory = None;
    DeleteAllowed = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Practice Fees"; Rec."Practice Fees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Fees field.', Comment = '%';
                }
                field("Renewal Fees"; Rec."Renewal Fees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Fees field.', Comment = '%';
                }
                field("Restoration Fees"; Rec."Restoration Fees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restoration Fees field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        LicensingPortal.fnCreateCategoryAsItem(Rec);
    end;

    trigger OnAfterGetRecord()
    begin
        LicensingPortal.fnCreateCategoryAsItem(Rec);
    end;

    trigger OnOpenPage()
    begin
        LicensingPortal.fnCreateCategoryAsItem(Rec);
    end;

    var
        LicensingPortal: Codeunit "Licensing Portal";
}
