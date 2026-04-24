import SwiftUI
import UIComponents

struct CoverTile: View {
    @Environment(\.theme) private var theme

    var body: some View {
        Tile(isActive: true) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Kyoto")
                    .textStyle(theme.typography.tileHeading)
                    .foregroundStyle(AccentDot.gold.color)

                Text("April 24 — 28 · Anderson")
                    .textStyle(theme.typography.tileBody)
                    .foregroundStyle(theme.colors.primaryText)
                    .opacity(0.55)

                Spacer(minLength: 0)

                TrackBar(
                    color: AccentDot.gold.color,
                    fraction: 0.34,
                    height: 3,
                    cornerRadius: theme.radius.thumbBar
                )
            }
        } footer: {
            TileFooter(accent: .gold, label: "01 · Cover", kind: "slide")
        }
    }
}

struct ItineraryTile: View {
    @Environment(\.theme) private var theme

    var body: some View {
        Tile {
            VStack(alignment: .leading, spacing: 5) {
                Text("Day 01 · Arashiyama")
                    .textStyle(theme.typography.tileHeadingSmall)
                    .foregroundStyle(theme.colors.primaryText)

                Group {
                    Text("Bamboo grove at dawn")
                    Text("Togetsukyo bridge")
                    Text("Tenryu-ji temple · tea")
                }
                .textStyle(theme.typography.tileBody)
                .foregroundStyle(theme.colors.primaryText)
                .opacity(0.55)

                Spacer(minLength: 0)

                TrackBarRow {
                    FractionalBar(
                        color: AccentDot.blue.color,
                        fraction: 0.18,
                        cornerRadius: theme.radius.thumbBar
                    )
                    FractionalBar(
                        color: AccentDot.blue.color,
                        fraction: 0.24,
                        cornerRadius: theme.radius.thumbBar,
                        opacity: 0.5
                    )
                }
            }
        } footer: {
            TileFooter(accent: .blue, label: "02 · Itinerary", kind: "slide")
        }
    }
}

struct BudgetTile: View {
    @Environment(\.theme) private var theme

    var body: some View {
        Tile {
            VStack(alignment: .leading, spacing: 5) {
                Text("¥ Budget split")
                    .textStyle(theme.typography.tileHeadingSmall)
                    .foregroundStyle(theme.colors.primaryText)
                    .opacity(0.8)

                Spacer(minLength: 0)

                TrackBarRow(height: 22) {
                    FractionalBar(
                        color: AccentDot.periwinkle.color,
                        fraction: 0.40,
                        height: 22,
                        cornerRadius: 3
                    )
                    FractionalBar(
                        color: AccentDot.green.color,
                        fraction: 0.28,
                        height: 22,
                        cornerRadius: 3
                    )
                    FractionalBar(
                        color: AccentDot.tan.color,
                        fraction: 0.20,
                        height: 22,
                        cornerRadius: 3
                    )
                }
                .padding(.bottom, 16)
            }
        } footer: {
            TileFooter(accent: .periwinkle, label: "03 · Budget", kind: "slide")
        }
    }
}
