

page 56083 "Tracks Card"
{
    PageType = Card;
    SourceTable = Tracks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Copyright No"; Rec."Copyright No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Copyright Title"; Rec."Copyright Title")
                {
                    ApplicationArea = Basic;
                }
                field("Track Title"; Rec."Track Title")
                {
                    ApplicationArea = Basic;
                }
                field("Track Work Category"; Rec."Track Work Category")
                {
                    ApplicationArea = Basic;
                }
                field("Track Work SubCategory"; Rec."Track Work SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field("Track Category Description"; Rec."Track Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Track SubCategory Desc"; Rec."Track SubCategory Desc")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Fixation/Reduction"; Rec."Date of Fixation/Reduction")
                {
                    ApplicationArea = Basic;
                }
                field("Track Works Abstract"; ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Track Work Abstract");
                        Rec."Track Work Abstract".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec."Track Work Abstract");
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec."Track Work Abstract".CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);

                        end;
                    end;
                }
                field("Track Language"; Rec."Track Language")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Production Details")
            {
                field("Prod/Pub Name"; Rec."Prod/Pub Name")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub ID No/Company Reg No"; Rec."Prod/Pub ID No/Company Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub P.I.N"; Rec."Prod/Pub P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment/License Date"; Rec."Assignment/License Date")
                {
                    ApplicationArea = Basic;
                }
                field("1st Country of Production"; Rec."1st Country of Production")
                {
                    ApplicationArea = Basic;
                }
                field("Production Category"; Rec."Production Category")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub Phone No."; Rec."Prod/Pub Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub Email"; Rec."Prod/Pub Email")
                {
                    ApplicationArea = Basic;
                }
                field("Producer Address"; Rec."Producer Address")
                {
                    ApplicationArea = Basic;
                }
                field("Producer Post Code"; Rec."Producer Post Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Other Persons")
            {
                Caption = 'Other Persons';
                part(Control24; "Tracks Other Persons")
                {
                    SubPageLink = Copyright = field("Copyright No"),
                                  "Tracks No" = field("Line No");
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Track Work Abstract");
        Rec."Track Work Abstract".CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    var
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
}

#pragma implicitwith restore

