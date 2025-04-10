

page 75125 "IFS Tender Document Source"
{
    PageType = List;
    SourceTable = "IFS Tender Document Source";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Tender Source ID"; Rec."Tender Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Source ID field.';
                    trigger onvalidate()
                    var
                        myInt: Integer;
                        tsource: Record "Tender Document Source";
                    begin
                        tsource.reset();
                        tsource.SetRange(code, Rec."Tender Source ID");
                        if tsource.FindFirst() then
                            Rec.Description := tsource.Description;

                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Url Link"; Rec."Url Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Url Link field.';
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Published field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

