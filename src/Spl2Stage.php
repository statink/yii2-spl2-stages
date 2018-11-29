<?php
/**
 * @copyright Copyright (C) 2015-2018 AIZAWA Hina
 * @license https://github.com/fetus-hina/stat.ink/blob/master/LICENSE MIT
 * @author AIZAWA Hina <hina@bouhime.com>
 */

declare(strict_types=1);

namespace statink\yii2\stages\spl2;

use Yii;
use yii\helpers\Html;
use yii\web\AssetBundle;

class Spl2Stage
{
    public static function img(
        string $effect,
        string $key,
        array $options = []
    ): string {
        return Html::img(
            static::url($effect, $key),
            $options
        );
    }

    public static function url(
        string $effect,
        string $key
    ): string {
        return Yii::$app->getAssetManager()->getAssetUrl(
            StagesAsset::register(Yii::$app->getView()),
            "{$effect}/{$key}.jpg"
        );
    }
}
