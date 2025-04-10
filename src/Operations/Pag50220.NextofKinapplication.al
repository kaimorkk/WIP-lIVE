namespace ALProjectLIWPA.ALProjectLIWPA;



page 50220 "Next Of KIn Application"
{
    Caption = 'HR Employee';
    PageType = List;
    SourceTable = "Next Of KIn Application";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
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
                field("Full Name"; Rec."Full Name")
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
                    Visible = false;
                    // RunObject = page "Human Resource Comment Sheet";
                    // RunPageLink = "Table Name" = const("Employee Relative"),
                    //               "No." = field("Employee Code");
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

    trigger OnClosePage()
    var
        myInt: Integer;
        Cummlative: Decimal;
        Nextofkinapp: Record "Next Of KIn Application";
    begin
        // if rec."Employee Code" <> '' then begin
        Nextofkinapp.Reset();
        Nextofkinapp.SetRange("Employee Code", Rec."Employee Code");
        Nextofkinapp.SetRange(Nextofkinapp."Document No.", Rec."Document No.");
        Nextofkinapp.SetRange(Type, Nextofkinapp.Type::Beneficiary);
        if Nextofkinapp.Find('-') then begin
            if Rec.Type = Rec.Type::Beneficiary then begin
                Nextofkinapp.CalcSums("Percentage Shares");
                Cummlative := Nextofkinapp."Percentage Shares";
                if Cummlative <> 100 then
                    Error('Percentrage shares must be equal to 100%');
            end;
        end;
        //end;

    end;

    var
        D: Date;
        NextOfKinVisible: Boolean;
}

