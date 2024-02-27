pageextension 55000 "PTE Sales Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter(Archiving)
        {
            group("Print Fee")
            {
                Visible = true;
                field("Print Fee Comment Code"; Rec."Print Fee Comment Code")
                {
                    ApplicationArea = All;
                }

                field("Print Fee G/L Account"; Rec."Print Fee G/L Account")
                {
                    ApplicationArea = All;
                }

                field("Print Fee Output Profile"; Rec."Print Fee Output Profile")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}