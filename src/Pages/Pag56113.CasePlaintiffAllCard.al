

page 56113 "Case Plaintiff All Card"
{
    PageType = Card;
    SourceTable = "Case Plantiffs All";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Second Name"; Rec."Second Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(Contacts; Rec.Contacts)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contacts field.';
                }
                field("Source Contact Code"; Rec."Source Contact Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Source Contact Code field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Postal Code"; Rec."Postal Code")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Post Code".Code;
                    ToolTip = 'Specifies the value of the Postal Code field.';
                    trigger OnValidate()
                    begin
                        PostCode.Reset;
                        PostCode.SetRange(Code, Rec."Postal Code");
                        if PostCode.Find('-')
                            then
                            Rec.City := PostCode.City;
                    end;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the City field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //PostCode.LookupPostCode(City,PostCode,County,"Country/Region Code");
                    end;

                    trigger OnValidate()
                    begin
                        //PostCode.ValidateCity(City,PostCode.Code,Country/Region."Country/Region",(CurrFieldNo <> 0) AND GUIALLOWED);
                        //PostCode.ValidateCity(City,"Postal Code",County);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    var
        PostCode: Record "Post Code";
        Country: Record "Country/Region";
        County: Text;
}

#pragma implicitwith restore

