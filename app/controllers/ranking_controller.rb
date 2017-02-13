class RankingController < ApplicationController
    def have
        item_ids = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
        @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
        @title = "持っているものランキング"
        render 'ranking/rank'
    end
    
    def want
        item_ids = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
        @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
        @title = "欲しいものランキング"
        render 'ranking/rank'
    end
end
