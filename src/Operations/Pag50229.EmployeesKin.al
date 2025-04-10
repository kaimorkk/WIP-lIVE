 
   
page 50229 "HR Employee Kin SF"
{
    Caption = 'HR Employee';
    PageType = List;
    SourceTable = "HR Employee Kin";
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Relationship; Rec.Relationship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Relationship field.';
                }
                field("Full Name"; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("ID No/Passport No"; Rec."ID No/Passport No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID No/Passport No field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(Occupation; Rec.Occupation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Occupation field.';
                }
                field("Percentage Shares"; Rec."Percentage Shares")
                {
                    ApplicationArea = Basic;
                    Visible = NextOfKinVisible;
                    ToolTip = 'Specifies the value of the Percentage Shares field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("E-mail"; Rec."E-mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-mail field.';
                }
                field("Office Tel No"; Rec."Office Tel No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office Tel No field.';
                }
                field("Home Tel No"; Rec."Home Tel No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Home Tel No field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Next of Kin")
            {
                Caption = '&Next of Kin';
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    RunObject = page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const("Employee Relative"),
                                  "No." = field("Employee Code");
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        NextOfKinVisible := false;

        if Rec.Type = Rec.Type::Beneficiary then
            NextOfKinVisible := true;
    end;

    var
        D: Date;
        NextOfKinVisible: Boolean;
}
